class GlucoseReading < ActiveRecord::Base

	belongs_to :user
	validates :observation_date, :glucose_level, presence: true
	validate :only_four_entries_for_day
	validates :glucose_level, numericality: { only_integer: true, greater_than: -1, less_than: 10 }

	def only_four_entries_for_day
		if GlucoseReading.where(user_id: self.user_id, observation_date: self.observation_date).count > 3
			errors.add(:glucose_level, "maximum four readings allowed for a day")
		end
	end

	def self.daily_report(observation_date, user_id)
		where("observation_date >= ? and user_id = ?", observation_date, user_id)
	end

	def self.month_to_date_report(observation_date, user_id)
		where(:observation_date => observation_date.beginning_of_month..observation_date, :user_id => user_id)
	end

	def self.last_month_report(observation_date, user_id)
		where(:observation_date => observation_date.prev_month..observation_date, :user_id => user_id)
	end

end
