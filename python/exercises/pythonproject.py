import sys
import re
import urllib2
import PyRSS2Gen
import ElementTree as ET
mLinks = []
mTitles = []
mDesc = []

#Read through entire file
url = "http://www.monmouth.edu/academics/CSSE/news.asp"
response = urllib2.urlopen(url)
input = response.read()

#Find the relevant html
x = re.findall("<a name=\"(.*?)\"(.*?)<hr />", input, re.DOTALL)

#Add to the link list
for i in range(len(x)):
    mLinks.append(url + "#" + x[i][0])

#Add to the titles list
for i in range(len(x)):
    titles = re.search("<strong>(.*?)</strong>", x[i][1])
    mTitles.append(titles.group(1))

#Add to the description list
for i in range(len(x)):
    description = re.findall("<p>(.*?)</p>", x[i][1], re.DOTALL)
    if len(description) < 140:
	mDesc.append(description)
    else:
	description[0:140]
	mDesc.append(description)

#Create an rss xml file
#rss = PyRSS2Gen.RSS2(
#title = "Python Project",
#link = "http://rockhopper.monmouth.edu/cs/jchung/cs498gpl/python_project",
#description = "Get the title, link, and description of each article and write them to a rss feed",
#items = []
#)

#Append all the elements into the items array
#for i in range(len(mTitles)):
#    a = PyRSS2Gen.RSSItem(title = mTitles[i], link = mLinks[i], description= mDesc[i])
#    rss.items.append(a)

#rss.write_xml(open('cssenews.rss.xml','w'))

root = ET.Element("channel")

for i in range(len(mTitles)):
    item = ET.SubElement(root, "item")
    title = ET.SubElement(item, "title")
    title.text = mTitles[i]
    link = ET.SubElement(item, "link")
    link.text = mLinks[i]
    description = ET.SubElement(item,"description")
    description.text = mDesc[i]
tree = ET.ElementTree(root)
tree.write("cssenews.rss.xml")