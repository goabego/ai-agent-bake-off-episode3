# EP3 Technical Deep Dive
Generated on Tue Jan  6 23:08:10 PST 2026

## Repo: ep3-agent-bake-off-startup-gtm-agents
### 🧠 Cognitive Architecture (Prompts vs. Logic)
- **Prompt Volume:** 7407 lines (Instructions, System Prompts)
- **Logic Volume:** 21223 lines (Python/TypeScript glue)
- **Prompt Density:** 34.00% of the codebase is natural language.

### 🛠️ Challenge Implementation Signatures
- ✅ **BigQuery (Challenge 3):** Detected (       3 refs)
- ❌ **MCP Server:** Not detected
- ❌ **A2A Protocol:** Not detected
- ✅ **Computer Vision (Challenge 6):** Detected (      26 refs)

### 📚 Tech Stack DNA
Top Imports:
  - ./frontend/lib/api-client.ts:import {
  - ./frontend/components/dashboard/AnalyticsChart.tsx:import { 
  - ./frontend/tailwind.config.ts:import type { Config } from "tailwindcss";
  - ./frontend/next.config.ts:import type { NextConfig } from "next";
  - ./frontend/lib/utils/theme-generator.ts:import { ThemeConfig } from '@/lib/types/launch';

### 🏗️ Ops & Infra
- **Docker:** ❌ Missing
- **Compose:** ❌ Missing
- **CI/CD:** ❌ Missing
---

## Repo: bq_hacker_news_agent
### 🧠 Cognitive Architecture (Prompts vs. Logic)
- **Prompt Volume:** 99 lines (Instructions, System Prompts)
- **Logic Volume:** 153 lines (Python/TypeScript glue)
- **Prompt Density:** 64.00% of the codebase is natural language.

### 🛠️ Challenge Implementation Signatures
- ✅ **BigQuery (Challenge 3):** Detected (      13 refs)
- ❌ **MCP Server:** Not detected
- ❌ **A2A Protocol:** Not detected
- ❌ **Computer Vision:** Not detected

### 📚 Tech Stack DNA
Top Imports:
  - ./app/agent.py:import os
  - ./app/agent.py:import google.auth
  - ./app/agent.py:from google.adk.tools.bigquery.config import WriteMode
  - ./app/agent.py:from google.adk.tools.bigquery.config import BigQueryToolConfig
  - ./app/agent.py:from google.adk.tools.bigquery import BigQueryToolset

### 🏗️ Ops & Infra
- **Docker:** ❌ Missing
- **Compose:** ❌ Missing
- **CI/CD:** ❌ Missing
---

## Repo: GTMForge
### 🧠 Cognitive Architecture (Prompts vs. Logic)
- **Prompt Volume:** 46026 lines (Instructions, System Prompts)
- **Logic Volume:** 12109 lines (Python/TypeScript glue)
- **Prompt Density:** 380.00% of the codebase is natural language.

### 🛠️ Challenge Implementation Signatures
- ✅ **BigQuery (Challenge 3):** Detected (    2216 refs)
- ✅ **MCP Server (Challenge 4):** Detected (      20 refs)
- ❌ **A2A Protocol:** Not detected
- ✅ **Computer Vision (Challenge 6):** Detected (     496 refs)

### 📚 Tech Stack DNA
Top Imports:
  - ./src/frontend/src/components/ActivityTimeline.tsx:import {
  - ./src/frontend/vite.config.ts:import tailwindcss from "@tailwindcss/vite";
  - ./src/frontend/vite.config.ts:import react from "@vitejs/plugin-react-swc";
  - ./src/frontend/vite.config.ts:import path from "node:path";
  - ./src/frontend/vite.config.ts:import { defineConfig } from "vite";

### 🏗️ Ops & Infra
- **Docker:** ❌ Missing
- **Compose:** ❌ Missing
- **CI/CD:** ❌ Missing
---

## Repo: launchpad
### 🧠 Cognitive Architecture (Prompts vs. Logic)
- **Prompt Volume:** 33071 lines (Instructions, System Prompts)
- **Logic Volume:** 1194 lines (Python/TypeScript glue)
- **Prompt Density:** 2769.00% of the codebase is natural language.

### 🛠️ Challenge Implementation Signatures
- ❌ **BigQuery:** Not detected
- ❌ **MCP Server:** Not detected
- ❌ **A2A Protocol:** Not detected
- ✅ **Computer Vision (Challenge 6):** Detected (       2 refs)

### 📚 Tech Stack DNA
Top Imports:
  - ./genmedia/nano_banana_generation.py:from PIL import Image
  - ./genmedia/nano_banana_generation.py:from io import BytesIO
  - ./genmedia/nano_banana_generation.py:from google.genai import types
  - ./genmedia/nano_banana_generation.py:from google import genai
  - ./genmedia/nano_banana_generation.py:from fastmcp import FastMCP

### 🏗️ Ops & Infra
- **Docker:** ❌ Missing
- **Compose:** ❌ Missing
- **CI/CD:** ❌ Missing
---

