


FROM rocker/r-base
MAINTAINER Adam Feldmann <adam.feldmann@aok.pte.hu>

# install additional packages
RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev

RUN R -e "install.packages(c('devtools','digest','jsonlite','httr','uuid'),repos='https://cran.rstudio.com/')"

RUN R -e 'devtools::install_github("trestletech/plumber")'

RUN mkdir /usr/local/lib/R/site-library/plumber/blockchaincore/
RUN ls -la /usr/local/lib/R/site-library/plumber*
COPY  blockchain.R /usr/local/lib/R/site-library/plumber/blockchaincore/
COPY  blockchain-node-server.R /usr/local/lib/R/site-library/plumber/blockchaincore/
COPY  plumberize.R /usr/local/lib/R/site-library/plumber/blockchaincore/

EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='127.0.0.1', port=8000)"]
CMD ["/usr/local/lib/R/site-library/plumber/blockchaincore/plumberize.R"]
