# Blog Deployer

基于 Node.js + Express 的博客部署服务，通过 Webhook 自动从 GitHub Releases 下载并部署博客。

## 功能特性

- 🚀 启动时自动从指定 URL 下载并部署博客
- 🔄 支持通过 Webhook API 触发更新
- 🔒 Token 验证保护更新接口
- 📦 Docker 支持，易于部署

## 快速开始

### 本地运行

1. 复制环境变量配置文件：

```bash
cp .env.example .env
```

2. 编辑 `.env` 文件，填写实际配置：

```env
PORT=3000
UPDATE_TOKEN=your_secret_token
BLOG_ZIP_URL=https://github.com/your-username/your-blog/releases/latest/download/blog-release.zip
DEPLOY_DIR=./public
```

3. 安装依赖并启动：

```bash
npm install
npm start
```

### Docker 部署

```bash
docker-compose up -d
```

## API 接口

### POST /api/update

触发博客更新。

**参数：**

| 参数 | 类型 | 说明 |
|------|------|------|
| token | Query | 验证 Token |

**示例：**

```bash
curl -X POST "http://localhost:3000/api/update?token=your_token"
```

## GitHub Actions 集成

此仓库的 GitHub Actions 会在代码更新时自动构建并推送 Docker 镜像到 GitHub Container Registry (GHCR)。

### 拉取镜像

```bash
docker pull ghcr.io/your-username/deployer:latest
```

### 使用镜像运行

```bash
docker run -d \
  -p 3000:3000 \
  -e PORT=3000 \
  -e UPDATE_TOKEN=your_token \
  -e BLOG_ZIP_URL=your_blog_zip_url \
  -e DEPLOY_DIR=/app/public \
  ghcr.io/your-username/deployer:latest
```

## 环境变量

| 变量名 | 必需 | 默认值 | 说明 |
|--------|------|--------|------|
| `PORT` | 否 | 3000 | 服务端口 |
| `UPDATE_TOKEN` | 是 | - | Webhook 验证 Token |
| `BLOG_ZIP_URL` | 是 | - | 博客 zip 下载地址 |
| `DEPLOY_DIR` | 否 | ./public | 静态文件部署目录 |

## 相关仓库

- [Night Blog](https://github.com/your-username/night-blog) - 博客源码仓库
