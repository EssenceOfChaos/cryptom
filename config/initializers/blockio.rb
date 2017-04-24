require 'block_io'
BlockIo.set_options :api_key => Rails.application.secrets.block_api, :pin => Rails.application.secrets.block_pin,  :version => 2

# Now you're good to go. Here's an example call:
# BlockIo.get_new_address(:label => 'shibe1')

# Bitcoin d9dc-bbb7-cb86-618d
#  User A, we'd want to call get_new_address with label=userAx{address_number} 
#  as many times as wish to create a new address for User A. 


# /api/v2/get_new_address/?api_key=API KEY
# /api/v2/get_new_address/?api_key=API KEY&label=LABEL
      


# BlockIo.get_new_address
# BlockIo.get_new_address :label => 'LABEL'
#       BlockIo.get_balance


# BlockIo.get_address_balance :addresses => 'ADDRESS1,ADDRESS2,...'
# BlockIo.get_address_balance :labels => 'LABEL1,LABEL2,...'