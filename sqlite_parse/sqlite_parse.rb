#!/usr/bin/ruby

require 'rubygems'
require 'sqlite3'

begin

    db = SQLite3::Database.open "RO.sqlite3"
    rows = db.execute <<SQL
      SELECT name FROM sqlite_master
        WHERE type='table'
        ORDER BY name;"
SQL

      rows.each do |row|
        columns = row.schema
        puts columns
      end

end
