function FindProxyForURL(url, host) {
  PROXY = "PROXY 127.0.0.1:8080"

  // localhost via proxy
  if (shExpMatch(host, "localhost")) {
    return PROXY;
  }
  // Everything else directly!
  return "DIRECT";
}
