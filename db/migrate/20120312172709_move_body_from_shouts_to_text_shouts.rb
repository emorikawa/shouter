class MoveBodyFromShoutsToTextShouts < ActiveRecord::Migration
  def up
    add_column :shouts, :medium_type, :string
    add_column :shouts, :medium_id, :integer

    # DON'T DO THIS:
    # Shouts.all.each do |shout|
    #   TextShout.create(body: shout.body)
    # end
    #
    # What if I added validations on body I didn't expect?!
    # What if all returns something different?!
    # It could change over time.

    # HEREDOC Syntax
    # Doesn't work, because we need to grab the ID of each item
    # execute <<-SQL
    #   INSERT INTO text_shouts (body, created_at, updated_at) SELECT shouts.body, shouts.created_at, shouts.updated_at FROM shouts
    # SQL

    # Need to do a Shouts.all.each do but can't do that because all might change over time.
    # SELECT id, body FROM shouts
    # select_all is a rails low-level command to grab values without hashes
    select_all("SELECT id, body, created_at, updated_at FROM shouts").each do |shout|
      id = insert <<-SQL
        INSERT INTO text_shouts (body, created_at, updated_at)
        VALUES("#{shout["body"]}", "#{shout["created_at"]}", "#{shout["updated_at"]}")
      SQL

      # MUST BE EXACTLY THE SAME AS THE MODEL NAME
      update <<-SQL
        UPDATE shouts
        SET medium_type="TextShout", medium_id=#{id}
        WHERE shouts.id = #{shout["id"]}
      SQL
    end

    remove_column :shouts, :body
  end

  def down
    add_column :shouts, :body, :text

    select_all("SELECT id, body FROM text_shouts").each do |text_shout|
      update <<-SQL
        UPDATE shouts
        SET body="#{text_shout["body"]}"
        WHERE medium_id=#{text_shout["id"]}
      SQL
    end

    remove_column :shouts, :medium_type
    remove_column :shouts, :medium_id
    delete("DELETE FROM text_shouts")
  end
end
