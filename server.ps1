$code = @"
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Threading.Tasks;

public class HighPerfHttpServer {
    private HttpListener _listener;
    private string _rootDir;
    private int _port;

    public HighPerfHttpServer(string rootDir, int port) {
        _rootDir = rootDir;
        _port = port;
        _listener = new HttpListener();
    }

    public void Start() {
        try {
            _listener.Prefixes.Add("http://*:" + _port + "/");
            _listener.Start();
        } catch {
            _listener = new HttpListener();
            _listener.Prefixes.Add("http://localhost:" + _port + "/");
            _listener.Prefixes.Add("http://127.0.0.1:" + _port + "/");
            _listener.Start();
        }

        Console.WriteLine("==========================================");
        Console.WriteLine(" High Performance C# Web Server Active!");
        Console.WriteLine(" Laptop: http://localhost:" + _port + "/");
        try {
            var host = System.Net.Dns.GetHostEntry(System.Net.Dns.GetHostName());
            foreach (var ip in host.AddressList) {
                if (ip.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork && !ip.ToString().StartsWith("127.")) {
                    Console.WriteLine(" Mobile: http://" + ip.ToString() + ":" + _port + "/");
                }
            }
        } catch {}
        Console.WriteLine("==========================================");

        while (_listener.IsListening) {
            try {
                var context = _listener.GetContext();
                Task.Run(() => HandleContext(context));
            } catch {
                if (!_listener.IsListening) break;
            }
        }
    }

    private void HandleContext(HttpListenerContext context) {
        try {
            var request = context.Request;
            var response = context.Response;

            response.Headers.Add("Access-Control-Allow-Origin", "*");
            response.Headers.Add("Cache-Control", "no-cache, no-store, must-revalidate");

            string rawPath = Uri.UnescapeDataString(request.Url.LocalPath);
            if (string.IsNullOrEmpty(rawPath) || rawPath == "/") {
                rawPath = "/index.html";
            }

            string relativePath = rawPath.TrimStart('/').Replace('/', Path.DirectorySeparatorChar);
            string filePath = Path.Combine(_rootDir, relativePath);

            if (File.Exists(filePath)) {
                string ext = Path.GetExtension(filePath).ToLower();
                response.ContentType = GetMime(ext);

                if (request.HttpMethod == "HEAD") {
                    FileInfo fi = new FileInfo(filePath);
                    response.ContentLength64 = fi.Length;
                    response.StatusCode = 200;
                } else {
                    byte[] fileBytes = File.ReadAllBytes(filePath);
                    response.ContentLength64 = fileBytes.Length;
                    response.StatusCode = 200;
                    response.OutputStream.Write(fileBytes, 0, fileBytes.Length);
                }
            } else {
                response.StatusCode = 404;
                byte[] notFound = Encoding.UTF8.GetBytes("404 Not Found");
                response.ContentLength64 = notFound.Length;
                response.OutputStream.Write(notFound, 0, notFound.Length);
            }
            response.Close();
        } catch {
            try { context.Response.Close(); } catch {}
        }
    }

    private string GetMime(string ext) {
        switch (ext) {
            case ".html": case ".htm": return "text/html; charset=utf-8";
            case ".css": return "text/css; charset=utf-8";
            case ".js": return "application/javascript; charset=utf-8";
            case ".png": return "image/png";
            case ".jpg": case ".jpeg": return "image/jpeg";
            case ".svg": return "image/svg+xml";
            case ".json": return "application/json";
            case ".ico": return "image/x-icon";
            default: return "application/octet-stream";
        }
    }
}
"@

Add-Type -TypeDefinition $code -Language CSharp
$server = New-Object HighPerfHttpServer($PSScriptRoot, 8000)
$server.Start()
