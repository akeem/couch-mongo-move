couch-mongo-move
================


Built out of the need to move data from couch to mongo for faster
computation, couch-mongo-move was born.

The idea is a simple application porting documents from couch to mongo,
generally speaking the schema of the document should remain the same
minus couch specific fields.

#Running an import

couch-mongo-move couchdb mongodb_uri
