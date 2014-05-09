{View} = require 'atom'

module.exports =
class HeaderView extends View
	@content: ->
		@div class: 'panel-heading padded heading theos-header-view', =>
			@span class: 'heading-title',  outlet: 'title'
			@code class: 'heading-command', outlet: 'command'
			@span class: 'heading-status', outlet: 'status'
			@span
				class:  'heading-close icon-remove-close pull-right'
				outlet: 'closeButton'
				click:  'close'

	close: ->
		atom.workspaceView.trigger 'theos-manager:close-view'

	setStatus: (status) ->
		@status.removeClass 'icon-alert icon-check icon-hourglass icon-stop'
		switch status
			when 'start' then @status.addClass 'icon-hourglass'
			when 'stop'  then @status.addClass 'icon-check'
			when 'kill'  then @status.addClass 'icon-stop'
			when 'err'   then @status.addClass 'icon-alert'
