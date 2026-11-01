{ domain, ... }: {
  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    dataDir = "/mnt/data/paperless";
    settings = {
      PAPERLESS_CONSUMER_IGNORE_PATTERN = [
        ".DS_STORE/*"
        "desktop.ini"
      ];
      PAPERLESS_OCR_LANGUAGE = "eng";
      PAPERLESS_OCR_USER_ARGS = {
        optimize = 1;
        pdfa_image_compression = "lossless";
      };
      PAPERLESS_URL = "https://records.${domain}";
    };
  };
}
