module Cloud
  class PokemonCommandJob
    class Serialiser
      attr_reader :data
      private :data

      def initialize(data)
        @data = data
      end

      def adapted_command_data
        {
          command: command,
          created_at: created_at,
          slack_name: slack_name,
          slack_id: slack_id,
        }
      end

      private

      def command
        data['command']
      end

      def created_at
        Time.now.strftime('%Y-%m-%d %H:%M:%S.%3N')
      end

      def slack_name
        data['slack_name']
      end

      def slack_id
        data['slack_id']
      end
    end
  end
end
