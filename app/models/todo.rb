# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  done        :string
#  in_progress :string
#  next_up     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Todo < ApplicationRecord
end
