#!/bin/bash
# 测试触发部署的脚本
# 请设置 UPDATE_TOKEN 和 DEPLOY_URL 环境变量

DEPLOY_URL="${DEPLOY_URL:-http://localhost:3000}"
UPDATE_TOKEN="${UPDATE_TOKEN:-your_token_here}"

curl -X POST "${DEPLOY_URL}/api/update?token=${UPDATE_TOKEN}"
