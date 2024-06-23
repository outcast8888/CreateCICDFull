$clusterName = "homeFullSys" # $clusterName = "my-cluster"
#$clusterExists = aws eks describe-cluster --name $clusterName --query 'cluster.status' --output text

if ($clusterExists -eq "ACTIVE") {
  Write-Output "Cluster already exists."
} else {
    Write-Output "Creating new cluster"
    terraform apply -auto-approve
}
