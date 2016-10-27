for a in range(1,829):
    numero = "{:0>4}".format(a)
    url = "http://www2.assemblee-nationale.fr/documents/notice/14/ta/ta%s/(index)/ta" % numero
    print("links2 -dump '%s' > %s.txt\necho %s" % (url, numero, numero))
    
