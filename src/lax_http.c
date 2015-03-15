#include <event2/buffer.h>
#include <event2/bufferevent.h>
#include <event2/event.h>
#include <event2/http.h>
#include <event2/util.h>
#include <lua.h>

static struct event_base *base;
static int ignore_cert = 0;

static void
http_request_done(struct evhttp_request *req, void *ctx)
{
	char buffer[256];
	int nread;

	if (req == NULL)
		return;

	fprintf(stderr, "Response line: %d\n",
	    evhttp_request_get_response_code(req));

	while ((nread = evbuffer_remove(evhttp_request_get_input_buffer(req),
		    buffer, sizeof(buffer)))
	       > 0) {
		/* These are just arbitrary chunks of 256 bytes.
		 * They are not lines, so we can't treat them as such. */
		fwrite(buffer, nread, 1, stdout);
	}
}


LUA_API int luaopen_lax_http(lua_State* L)
{
    return 1;
}
