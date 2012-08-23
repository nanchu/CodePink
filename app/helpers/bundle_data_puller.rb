module BundleDataPuller

  def getUrl(pageNumber=1, start=0, limit=1)
    "http://pakistanbodycount.org/functions.php?action=droneattacks&_dc=1343791499405&page=" + pageNumber.to_s + "&start=" + start.to_s + "&limit=" + limit.to_s + "&sort=display_date&dir=ASC"
  end
  #What number of records do we have in the database
  def pullChunkOfData(startFrom=100)
    hundred = 50
    limit = startFrom % hundred * hundred
    puts limit

    pageNumber = startFrom % hundred
    puts pageNumber

    dataPuller = DataHelper.new

    while(!jsonData.nil?)
      url = getUrl(pageNumber, 0, limit)
      jsonData = dataPuller.pull_data(url)

      dataPuller.update_db(jsonData)
      pageNumber+=1
    end



  end
end