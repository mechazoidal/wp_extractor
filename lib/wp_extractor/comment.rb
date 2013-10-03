module WpExtractor
  class Comment < Sequel::Model(:kp_comments)

    many_to_one :post, :key=>:comment_post_ID

    self.dataset_module do
      def without_pingbacks
        filter('comment_type' => '')
      end
    end
    
    def by_owner?
      self.user_id == 1
    end

    def to_hash
      {:author=>comment_author,
        :email=>comment_author_email,
        :url=>comment_author_url,
        :gmt_date=>comment_date_gmt,
        :content=>comment_content,
        :by_owner=>by_owner?
      }
    end

    def to_markdown
      unescaped_content = comment_content.gsub(/(\r)?\n/, "\n")
      "[#{comment_author}](#{comment_author_url}): #{unescaped_content}"
    end
    
  
  end
end
