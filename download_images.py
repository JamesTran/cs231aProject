import urllib
import os

# Folder with the files listing out the image URLs
URL_DIR = 'dataset'

# Folder to download images to
DOWNLOAD_DIR = 'images'

# Maximum number of database images to download per landmark
MAX_DB_IMAGES = 2

# Maximum number of test images to download per landmark
MAX_TEST_IMAGES = 1

# Parses the input file (list of URLs) and downloads the images
def parse_input(url_file, dest, max_downloads):
    num_downloaded = 0
    for line in url_file:
        splitted = line.split()
        name = splitted[0]
        url = splitted[1]
        width = splitted[2]
        height = splitted[3]
        urllib.urlretrieve(url, dest + '/' + name)
        num_downloaded += 1
        if num_downloaded >= max_downloads:
            break

download_path = os.getcwd() + '/' + DOWNLOAD_DIR
if not os.path.exists(download_path):
    os.makedirs(download_path)

for landmark in os.listdir(os.getcwd() + '/' + URL_DIR):
    landmark_dir = os.getcwd() + '/' + URL_DIR + '/' + landmark
    if not os.path.isdir(landmark_dir):
        continue

    db_images = open(landmark_dir + '/list_db.txt')
    download_dest = download_path + '/' + landmark + '/db'
    if not os.path.exists(download_dest):
        os.makedirs(download_dest)
    parse_input(db_images, download_dest, MAX_DB_IMAGES)

    test_images = open(landmark_dir + '/list_test.txt')
    download_dest = download_path + '/' + landmark + '/test'
    if not os.path.exists(download_dest):
        os.makedirs(download_dest)
    parse_input(test_images, download_dest, MAX_TEST_IMAGES)
