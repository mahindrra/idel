json.extract! course, :id, :name, :duration, :audience, :course_objective, :no_of_objective, :session, :skill_based, :knowledge_based, :user_id, :learner_style_id, :created_at, :updated_at
json.url course_url(course, format: :json)