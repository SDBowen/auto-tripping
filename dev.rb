system( 'fuser -k 3000/tcp' )
system( "echo 'Port 3000 cleared'" )

system( 'rails s' )
