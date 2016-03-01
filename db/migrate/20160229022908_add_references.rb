class AddReferences < ActiveRecord::Migration
  def change
    add_reference :gigs, :category, index:true
    add_reference :proposals, :gig, index: true
    add_reference :abilities, :gig, index: true
    add_reference :abilities, :skill, index:true
  end
end
