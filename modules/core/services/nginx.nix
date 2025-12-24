{ ... }:

{
  services.nginx.enable = true;
  services.nginx.virtualHosts."localhost" = {
    root = "/var/www";
  };
  services.fcgiwrap.enable = true;

  environment.etc = {
    "nginx/sites-available/gitolite.conf".text = # conf
      ''
        server {
            listen 8000;
            server_name localhost;

            location /git/ {
                root /home/gitolite;
                auth_basic "Git Access";
                auth_basic_user_file /etc/nginx/git-http-auth;

                include fastcgi_params;
                fastcgi_param SCRIPT_FILENAME /usr/lib/git-core/git-http-backend;
                fastcgi_param GIT_PROJECT_ROOT /home/gitolite/repositories;
                fastcgi_param GIT_HTTP_EXPORT_ALL "";
                fastcgi_pass unix:/run/fcgiwrap.socket;  # or TCP:127.0.0.1:9000
            }
        }
      '';
  };
}
