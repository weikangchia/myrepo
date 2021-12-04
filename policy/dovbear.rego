package main

# should not deplot to default namespace
warn[msg] {
  not input.metadata.namespace
  msg := sprintf("%s %s is deployed to default namespace", [ input.kind, input.metadata.name ])
}

warn[msg] {
  "default" = input.metadata.namespace
  msg := sprintf("%s %s is deployed to default namespace", [ input.kind, input.metadata.name ])
}

# should never use latest tag
deny[msg] {
  "Deployment" = input.kind
  endswith(input.spec.template.spec.containers[_].image, ":latest")
  msg := sprintf("%s %s is using latest tag", [ input.kind, input.metadata.name ])
}

