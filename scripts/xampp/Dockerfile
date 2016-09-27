# This is a comment
FROM ubuntu:16.04
MAINTAINER William Hilton <wmhilton@gmail.com>
# XAMPP layers
COPY setup-xampp.sh /root/
RUN bash /root/setup-xampp.sh
ENV PATH "/opt/lampp/bin:$PATH"
# MailCatcher layers
COPY setup-mailcatcher.sh /root/
RUN bash /root/setup-mailcatcher.sh
