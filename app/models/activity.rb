class Activity < ActiveRecord::Base

  belongs_to :task
  belongs_to :grade

  after_initialize :set_console

  attr_accessor :console

  def complete!
    self.completed = true
    self.save
    self.grade.build_next_activity(self)
  end

  def compile(params)
    processed_source = environment.pre_process(self.task.expectations, self.source_code)
    response = environment.compile(processed_source, "App", ["main"])
    update_console(response)
    if environment.validate(self.task.expectations, self.source_code, response)
      self.complete!
      return self.grade.actual_activity
    end

   return self;
  end

    private

      def update_console(response)
        self.console += "> "  + response["output"].join("\r\n> ") if response["output"].length > 0
        self.console += "> " + response["exception"] + "\r\n" unless response["exception"].empty?
      end

      def set_console
        self.console = "" if self.console.nil?
      end

      def environment
        EnvironmentManager.get(task.track.language)
      end

end
