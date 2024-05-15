#!/bin/bash

# This script runs every time your Studio starts, from your home directory.

# List files under fast_load that need to load quickly on start (e.g. model checkpoints).
#
# ! fast_load
# .ollama/models/blobls/sha256-00e1317cbf74d901080d7100f57580ba8dd8de57203072dc6f668324ba545f29
# .ollama/models/blobls/sha256-4fa551d4f938f68b8c1e6afa9d28befb70e3f33f75d0753248d530364aeea40f
# .ollama/models/blobls/sha256-577073ffcc6ce95b9981eacc77d1039568639e5638e83044994560d9ef82ce1b
# .ollama/models/blobls/sha256-8ab4849b038cf0abc5b1c9b8ee1443dca6b93a045c2272180d985126eb40bf6f
# .ollama/models/blobls/sha256-ad1518640c4364a2c213b35a98f376f19035472cc64326ee4b84d926cb7a1522
# .ollama/models/manifests/registry.ollama.ai/library/llama3/latest
# bin/ollama

# 1. create log folder
mkdir -p ~/log

# 2. Run the ollama server
~/bin/ollama serve > ~/log/ollama.log 2> ~/log/ollama.err &

# 3. Preload the model
curl http://localhost:11434/api/generate -d '{"model": "llama3"}'