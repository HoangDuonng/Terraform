bucket_name    = "ocr_project_file_storage"
location       = "ASIA-SOUTHEAST1"
storage_class  = "STANDARD"
force_destroy  = false
project_id     = "codezx-intern"
prefixes       = [
    "input/pdf_to_docx/",
    "input/pdf_to_image/",
    "input/word_to_pdf/",
    "input/word_to_image/",
    "input/image_to_word/",
    "input/image_to_text/",
    "input/extract_page/",
    "input/organize/",

    "output/pdf_to_docx/",
    "output/pdf_to_image/",
    "output/word_to_pdf/",
    "output/word_to_image/",
    "output/image_to_word/",
    "output/image_to_text/",
    "output/extract_page/",
    "output/organize/"
]

vm_name        = "ocr-vm"
machine_type   = "e2-standard-4"
zone           = "asia-southeast1-a"
disk_size      = 50
image          = "ubuntu-os-cloud/ubuntu-2204-lts"
network        = "default"
