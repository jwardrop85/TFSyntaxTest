
data "local_file" "dscfile" {
    filename = "./dscconfig/cishardentest.ps1"
}

locals {
  dsccontent = "${data.local_file.dscfile.content}"
}

locals {
  utfdsccontent = "${replace(local.dsccontent,"/\\n/","")}"
  depends_on = ["local.dsccontent"]
}


output "removeutfhead" {
  value="${file(data.local_file.dscfile.filename)}"
  depends_on = ["local.utfdsccontent"]
}
#${data.local_file.dscfile.content}
