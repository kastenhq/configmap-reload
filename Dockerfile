ARG CMRELOAD_IMAGE
FROM ${CMRELOAD_IMAGE} as CMRELOAD

FROM registry.access.redhat.com/ubi8/ubi-minimal:8.1

COPY ./LICENSE.txt /licenses/

USER 65534

ARG BINARY=configmap-reload
ARG VERSION
ARG RELEASE

COPY --from=CMRELOAD /configmap-reload /configmap-reload

LABEL name="configmap-reload" \
    version="${VERSION}" \
    release="${RELEASE}" \
    vendor="github.com/jimmidyson/configmap-reload" \
    summary="Binary to trigger a reload when Kubernetes ConfigMaps are updated" \
    description="configmap-reload is a simple binary to trigger a reload when Kubernetes ConfigMaps are updated."

ENTRYPOINT ["/configmap-reload"]
