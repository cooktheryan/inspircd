FROM centos:latest
MAINTAINER Stephen Adams <tsadamsjr@gmail.com>

# Pull down inspircd and drop in /src in container
ADD https://github.com/inspircd/inspircd/archive/v2.0.19.tar.gz /src/

# update the container
RUN yum update -y

# install requirements
RUN yum install -y tar make gcc gcc-c++ libgcc bzip2 git

# add inspircd user, configure ldap module, install dependencies for ldap, configure inspircd, install to /inspircd
RUN useradd -u 10000 inspircd && cd /src && tar -xzvf v2.0.19.tar.gz && cd inspircd-2.0.19 && ./configure --enable-extras=m_ldapauth.cpp --enable-extras=m_ssl_gnutls.cpp && yum install -y openssl openldap-devel openldap-clients openldap gnutls gnutls-devel pkgconfig && ./configure --disable-interactive --prefix=/inspircd/ --uid 10000 && make && make install && yum clean all

# ensure ownership of /inspircd by inspircd user
RUN chown -R inspircd:inspircd /inspircd 

# expose ports 6667 and 6697
EXPOSE 6667 6697

# mount a volume for configs (should use git pulls to yank current configurations)
VOLUME ["/root/inspircd/conf"]

# launch inspircd with --nofork so it stays in the foreground
ENTRYPOINT ["/inspircd/inspircd", "start", "--nofork"]
