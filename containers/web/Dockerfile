FROM centos

COPY nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum install -y nginx

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
