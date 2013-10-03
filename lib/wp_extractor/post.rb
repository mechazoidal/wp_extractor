module WpExtractor
  class Post < Sequel::Model(:kp_posts)
    one_to_many :comments, :key=>:comment_post_ID
    many_to_many :terms, :join_table=>:kp_term_relationships, 
                         :right_key=>:term_taxonomy_id, 
                         :left_key=>:object_id, 
                         :order=>:term_order
  
    self.dataset_module do
      def pages
        filter(:post_type=>'page')
      end
      def published
        filter(:post_status=>'publish')
      end
      def posts
        filter(:post_type=>'post')
      end
      def with_comments
        filter('comment_count > ?', '0')
      end
    end

    def categories
      self.terms.collect{|term| term.name}
    end

    def attached_comments
      self.comments_dataset.filter(:comment_type=>'').order(:comment_date_gmt).reverse
    end

    def safe_title
      self.post_title.downcase.gsub(/\W/, '-')
    end

    def html_title
      "<h1>#{self.post_title}</h1>"
    end

    def html_posted_at
      "<h2>#{self.post_date.strftime("%Y-%m-%d")}</h2>"
    end

    def safe_content
      self.post_content.encode("UTF-8", :invalid => :replace, 
                                        :undef => :replace, 
                                        :replace => "??").gsub(/(\r)?\n/, "\n")
    end

    def to_hash
      {:published_at=>post_date_gmt,
        :title=>post_title,
        :body=>post_content,
        :url=>guid,
        :comments=>attached_comments,
        :categories=>categories
      }
    end
    
  end
end
