#!/usr/bin/ruby

name={
	 1 => "01_Conference_on_Machine Translation (CMT)",
	 2 => "02_Conference on Machine Translation (WMT)",
	 3 => "03_Conference on Statistical Machine Translation (CMT)",
	 4 => "04_Conference on Statistical Machine Translation (CSMT)",
	 5 => "05_Conference on Statistical Machine Translation (SMT)",
	 6 => "06_Conference on Statistical Machine Translation (CoSMaT)",
	 7 => "07_Conference on Statistical Machine Translation (WMT)",
	 8 => "08_Conference on Empirical Methods in Machine Translation (EMMT)",
	 9 => "09_Conference on Data-Driven Machine Translation (DDMT)",
	10 => "10_WMT Conference on Machine Translation (WMT)",
	11 => "11_World Conference on Machine Translation (WMT)",
	12 => "12_International Conference in Machine Translation (ICMT) write-in",
	13 => "13_Machine Translation Conference (MTC) write-in"
}

class Item
	attr_reader :rank, :id

	def initialize(id, rank)
		@id=id
		@rank=rank
	end

end

STDIN.each_line{|line|

	parts=line.strip.split
	parts.unshift(1000)
	parts.pop
	parts.pop
	parts.pop
	parts.pop
	
	items=Array.new
	parts.each_with_index{|rank,id|
		items.push(Item.new(id,rank.to_i))
	}
	
	items=items.sort_by{|item| item.rank}
		
	current_item=items.shift
	print name[current_item.id]
	while (items.size > 0)
		next_item=items.shift
		unless (next_item.id==0)
			if (next_item.rank==current_item.rank)
				print "="
			else
				print ">"
			end
			print name[next_item.id]
			current_item=next_item
		end
	end
	print "\n"

}
