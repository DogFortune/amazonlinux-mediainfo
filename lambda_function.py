import logging
import subprocess
import boto3
import xml.etree.ElementTree as ET
from botocore.client import Config

import os

logger = logging.getLogger('boto3')
logger.setLevel(logging.INFO)

def get_media_infomation():
    media_info_path = os.path.join(os.path.dirname(__file__), "mediainfo")
    media_info = subprocess.check_output([media_info_path, "--version"])
    return media_info

def lambda_handler(event, context):
    media_info = get_media_infomation()
    logger.info(media_info)
    return
