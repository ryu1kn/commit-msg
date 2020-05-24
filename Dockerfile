FROM haskell:8.8.3

COPY ./ /build/

WORKDIR /build

RUN stack build
