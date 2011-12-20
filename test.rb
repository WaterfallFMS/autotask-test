require 'soap/wsdldriver'
require 'pp'

$WSDL = "https://webservices5.autotask.net/atservices/1.4/atws.wsdl"
$USER = 'jkamenik@bluewatermedia.net'
$PASS = ''

def inspect(obj)
  pp obj
  # only print the methods that are SOAP defined
  pp obj.methods.collect {|meth| meth =~ /[A-Z]/ ? meth : nil}.compact
end

soap = SOAP::WSDLDriverFactory.new($WSDL).create_rpc_driver
soap.wiredump_dev = STDOUT  # enable debugging

user_pass = {
  :username => $USER,
  :password => $PASS
}

# create
# query
# update
# "getEntityInfo",
# "getFieldInfo",
# "getThresholdAndUsageInfo",
# "getUDFInfo",
# "getZoneInfo",

# this has to go first to find all the information
zone = soap.getZoneInfo(user_pass)
results = zone.getZoneInfoResult
url  = results.uRL

puts "Soap after request:"
pp soap.wiredump_dev
inspect soap

puts "Zone:"
inspect zone

puts "Results:"
inspect zone.getZoneInfoResult
puts zone.getZoneInfoResult.errorCode

puts "URL:"
inspect zone.getZoneInfoResult.uRL

puts "Database type:"
inspect zone.getZoneInfoResult.dataBaseType


# puts soap.getThresholdAndUsageInfo(user_pass)
