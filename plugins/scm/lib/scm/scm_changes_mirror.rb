
module Redcar
  module Scm
    class ScmChangesMirror
      include Redcar::Tree::Mirror
      
      def initialize(repo)
        @repo = repo
      end
      
      def title
        @repo.translations[:uncommited_changes]
      end
      
      def data_type
        :text
      end
      
      # Root items will never change
      def changed?
        false
      end
      
      def drag_and_drop?
        false
      end
      
      def top
        @top ||= begin
          [ScmChangesMirror::ChangesNode.new(@repo)]
        end
      end
    end
  end
end
