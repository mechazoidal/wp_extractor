module WpExtractor
  class Term < Sequel::Model(:kp_terms)
    many_to_many :posts, :join_table=>:kp_term_relationships, 
                         :left_key=>:term_taxonomy_id, 
                         :right_key=>:object_id, 
                         :order=>:term_order
  end
end
