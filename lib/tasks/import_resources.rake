
namespace :import_resources do
  desc "TODO"
  task parse_file: :environment do
    file = File.open("#{Rails.root}/db/seed/resources.txt", 'r')
    content = file.read
    addresses = content.scan(/\d+\.\d+\.\d+\.\d+/) #extract IP addresses
    dates = content.scan(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/) #extract timestamps
    matched = addresses.zip(dates) #make a multidimensional array of the values paired up
    # new_matched = matched.delete_if { |k, v| v.nil? } #discard nil values
    new_matched = matched.delete_if do |elem|
        elem[1] == nil
    end
    sorted = new_matched.sort_by{|first, last| first }
    grouped = sorted.each_with_object({}) { |(f,l),h| h.update(f=>l) { |_,ov,nv| ov.is_a?(Array) ? ov << nv : [ov, nv] } }
    # hashed = new_matched.map{ |k,v| { k.to_sym => v } } #turn into an array of hashes
    # grouped = hashed.flat_map(&:entries).group_by(&:first).map{|k,v| Hash[k, v.map(&:last)]}
    grouped.each do |address, date|
        Request.create(
          ip_address: address,
          dates: date
        )
        end
    end


  desc "TODO"
  task seed_db: :environment do
  end

end
