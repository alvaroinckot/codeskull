class Activity < ActiveRecord::Base

  belongs_to :task
  belongs_to :grade
  
  attr_accessor :console

  def compile(params)

    response = environment.compile(pre_process_source) # todo check ouput expecs
    self.console = response

    # self.console = "Compilado com sucesso!\n"
	 # self.completed = true # validate expectations
    # self.save
    # self.grade.build_next_activity(self)
	 # return self.grade.actual_activity # return the next task or finish
   return self;
  end

    private

      def pre_process_source
        self.source_code
      end

      def check_var_expectations
        true
      end

      def check_output_expectations
        true
      end

      def environment
        @environment = EnvironmentManager.get(task.track.language)
      end

end
