class ReindexingJob

  @@my_yaml = ReindexingJob.new.to_yaml

  def perform
    todo = ReindexingQueue.find(:all).collect do |queued|
      todo = queued.item
      queued.destroy
      todo
    end
    todo.uniq.each do |item|
      item.solr_index!
    end
  end

  def self.exists?
    Delayed::Job.find(:first,:conditions=>['handler = ?',@@my_yaml]) != nil
  end
end