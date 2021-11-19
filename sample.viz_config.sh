#!/bin/bash

# Resource group(s) to diagram
RESOURCE_GROUP="my-rg1,my-rq2"
# Diagram export location
OUT_FILE="/bin/viz.png"
# Azure username
USER_ID="user@microsoft.com"
# Azure subscription name
SUB_NAME="My-Sub"
# Set light, dark, or neon
THEME="neon"
# Level of Azure Resource Sub-category to be included in vizualization
# (1 or 2)
DEPTH=1
# Level of information to included in vizualization
# (1 or 2)
VERBOSITY=2
# Set png or svg
FORMAT="png"
# Direction in which resource groups are plotted on the visualization 
# (left-to-right or top-to-bottom)
DIRECTION="top-to-bottom"
# Exclude resources via string search
EXCLUDE_TYPES="*exclude1*,*exclude2*"
# Controls how edges appear in visualization
# Default is "spline" and other supported values are "polyline", "curved", "ortho", "line"
SPLINES="spline"
