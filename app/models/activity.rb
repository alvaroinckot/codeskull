class Activity < ActiveRecord::Base

  belongs_to :task
  belongs_to :grade

  attr_accessor :console

  def compile(params)

    response = environment.compile(pre_process_source) # todo check ouput expecs
    self.console = response["output"]
      .select { |output| output.include? "{" }
      .map do |c| 
        JSON.parse(c) 
      end

    # self.console = "Compilado com sucesso!\n"
	 # self.completed = true # validate expectations
    # self.save
    # self.grade.build_next_activity(self)
	 # return self.grade.actual_activity # return the next task or finish
   return self;
  end

    private

      def pre_process_source
        self.source_code + self.task.expectations.map { |exp| exp.to_code }.inject { |pre, post| pre + post }
      end

      def check_var_expectations
        true # self.expectations.check(output)
      end

      def environment
        @environment = EnvironmentManager.get(task.track.language)
      end

end
