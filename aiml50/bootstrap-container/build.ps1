param (
    [parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Version,
    [string]$Organization = 'smurawski'
)

docker build -t "${Organization}/deploy-aiml50:latest" .
docker tag "${Organization}/deploy-aiml50:latest" "${Organization}/deploy-aiml50:${Version}"
docker push "${Organization}/deploy-aiml50:latest"
docker push "${Organization}/deploy-aiml50:${Version}"
