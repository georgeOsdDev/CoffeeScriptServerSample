#SimpleLogger
module.exports = class SimpleLogger
	FATAL = '[ FATAL ]'
	ERROR = '[ ERORR ]'
	WARN = '[ WARN ]'
	INFO = '[ INFO ]'
	DEBUG = '[ DEBUG ]'
	TRACE = '[ TRACE ]'

	constructor: (@prefix) ->

	leftZeroPad: (num) ->
		if num < 10 then "0" + num else num	

	localeTime: ->
		date = new Date()
		date.getFullYear() + "-" + @leftZeroPad(date.getMonth() + 1) + "-" + @leftZeroPad(date.getDate()) + " " + @leftZeroPad(date.getHours()) + ":" + @leftZeroPad(date.getMinutes()) + ":" + @leftZeroPad(date.getSeconds())

	log: (args...) ->
		args.unshift @prefix + " " if @prefix
		args.unshift @localeTime() + " "
		console?.log(args...)
		#console?.log(args.toString())

	fatal: (args...) ->
		args.unshift FATAL
		@log args...

	error: (args...) ->
		args.unshift ERROR
		@log args...

	warn: (args...) ->
		args.unshift WARN
		@log args...

	info: (args...) ->
		args.unshift INFO
		@log args...

	debug: (args...) ->
		args.unshift DEBUG
		@log args...

	trace: (args...) ->
		args.unshift TRACE
		@log args...

	setLevel: (level) ->
		@level = level

	getLevel: ->
		@level
		
###
#Sample Exec
console.log "-----------------------------------------"

appLogger = new SimpleLogger("[ APP ]")
sysLogger = new SimpleLogger("[ SYS ]","info")

sysLogger.log "I'm sysLogger"
appLogger.log "I'm appLogger"

sysLogger.fatal "I'm sysLogger it's fatal"
sysLogger.error "I'm sysLogger it's error"
sysLogger.warn "I'm sysLogger it's warn"
sysLogger.info "I'm sysLogger it's info"
sysLogger.debug "I'm sysLogger it's debug"
sysLogger.trace "I'm sysLogger it's trace"

appLogger.fatal "I'm appLogger it's fatal"
appLogger.error "I'm appLogger it's error"
appLogger.warn "I'm appLogger it's warn"
appLogger.info "I'm appLogger it's info"
appLogger.debug "I'm appLogger it's debug"
appLogger.trace "I'm appLogger it's trace"

console.log "-----------------------------------------"

how to use in other file
##################################
# Logger = require("path/to/SimpleLogger")
# myLogger = new Logger("[mylogger]")
# 
# myLogger.log "Hello World"
# myLogger.warn "Warning"
##################################


###