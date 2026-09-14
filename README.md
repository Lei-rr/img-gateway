# OpenAI 标准生图转换网关 (Image Gateway)

专门将 Google Gemini 生图模型（`gemini-3.1-flash-image` / `2K` / `4K`）转译为标准 OpenAI 绘图接口（`/v1/images/generations` 和 `/v1/images/edits`）。

---

## 一、服务信息

- **服务地址**：`http://your-server-ip:3001`
- **接口 Base URL**：`http://your-server-ip:3001/v1`
- **API Key**：`sk-your-service-key`
- **支持模型**：
  - `gemini-3.1-flash-image`（标准高清）
  - `gemini-3.1-flash-image-2K`（2K 超清，分辨率约 2752x1536）
  - `gemini-3.1-flash-image-4K`（4K 极限超清，分辨率约 5632x3072）

---

## 二、调用示例

### 1. cURL 文生图
```bash
curl -X POST http://your-server-ip:3001/v1/images/generations \
  -H "Authorization: Bearer sk-your-service-key" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gemini-3.1-flash-image",
    "prompt": "A cute white rabbit on green grass",
    "size": "1:1",
    "n": 1
  }'
```

**响应示例**：
```json
{
  "created": 1789379812,
  "data": [
    {
      "url": "http://your-server-ip:3001/images/1789379812300_7ego1s3.jpg"
    }
  ]
}
```

---

### 2. Python (使用官方 `openai` SDK)
```python
from openai import OpenAI

client = OpenAI(
    base_url="http://your-server-ip:3001/v1",
    api_key="sk-your-service-key"
)

response = client.images.generate(
    model="gemini-3.1-flash-image",
    prompt="A futuristic neon city at night",
    size="1024x1024",
    n=1
)

image_url = response.data[0].url
print("图片直链:", image_url)
```

---

### 3. Node.js (使用官方 `openai` SDK)
```javascript
import OpenAI from "openai";

const openai = new OpenAI({
  baseURL: "http://your-server-ip:3001/v1",
  apiKey: "sk-your-service-key",
});

const response = await openai.images.generate({
  model: "gemini-3.1-flash-image",
  prompt: "A cozy coffee shop in rainy Tokyo night",
  n: 1,
});

console.log("图片直链:", response.data[0].url);
```

---

## 三、运维管理

- 进入目录：`cd /guolei/img-gateway`
- 查看日志：`docker compose logs -f`
- 重启服务：`docker compose restart`
- 图片保存路径：`/guolei/img-gateway/data/images/`
