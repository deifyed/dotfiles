#!/usr/bin/env bash
set -euo pipefail

for cmd in aws fzf jq; do
  command -v "$cmd" &>/dev/null || {
    echo "Required: $cmd" >&2
    exit 1
  }
done

pick() {
  local label="$1"
  local items="$2"
  local count
  count=$(echo "$items" | wc -l)

  if [[ $count -eq 0 || -z "$items" ]]; then
    echo "No ${label,,} found" >&2
    exit 1
  elif [[ $count -eq 1 ]]; then
    echo "$items" | head -1
  else
    echo "$items" | fzf --prompt="$label: "
  fi
}

clusters=$(aws ecs list-clusters --query "clusterArns[*]" --output json |
  jq -r '.[]' |
  sed 's|.*/||')
cluster=$(pick "Cluster" "$clusters")

services=$(aws ecs list-services --cluster "$cluster" --query "serviceArns[*]" --output json |
  jq -r '.[]' |
  sed 's|.*/||')
service=$(pick "Service" "$services")

tasks=$(aws ecs list-tasks --cluster "$cluster" --service-name "$service" --desired-status RUNNING --query "taskArns[*]" --output json |
  jq -r '.[]' |
  sed 's|.*/||')
task=$(pick "Task" "$tasks")

containers=$(aws ecs describe-tasks --cluster "$cluster" --tasks "$task" --query "tasks[0].containers[*].name" --output json |
  jq -r '.[]')
container=$(pick "Container" "$containers")

echo "Connecting to $container in $task ($cluster)..."
aws ecs execute-command \
  --cluster "$cluster" \
  --task "$task" \
  --container "$container" \
  --interactive \
  --command "/bin/sh"
