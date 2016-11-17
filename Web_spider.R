library(XML)
library(RCurl)
myHttpheader <- c(
  
  "User-Agent"="Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.6) ",
  
  "Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
  
  "Accept-Language"="en-us",
  
  "Connection"="keep-alive",
  
  "Accept-Charset"="GB2312,utf-8;q=0.7,*;q=0.7"
  
)
url <- "http://regulomedb.org/GWAS/all.html"
webpage <- getURL(url,httpheader=myHttpheader)
pagetree <- htmlTreeParse(webpage,encoding="UTF-8", error=function(...){}, useInternalNodes = TRUE,trim=TRUE)
node<-getNodeSet(pagetree, "//a[@href]/text()")
info<-sapply(node,xmlValue)
re=data.frame(info)
write.table(re,file = "E:/aaa.txt",col.names = F,row.names = F,quote=F,sep="\t")
#this script was initially programmed by Ronlee12355.