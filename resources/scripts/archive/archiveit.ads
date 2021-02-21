-- Copyright 2017 Jeff Foley. All rights reserved.
-- Use of this source code is governed by Apache 2 LICENSE that can be found in the LICENSE file.

name = "ArchiveIt"
type = "archive"

function start()
    setratelimit(5)
end

function vertical(ctx, domain)
    scrape(ctx, {['url']=firsturl(domain)})
    checkratelimit()
    scrape(ctx, {['url']=secondurl(domain)})
end

function firsturl(domain)
    return "https://wayback.archive-it.org/all/timemap/cdx?matchType=domain&fl=original&collapse=urlkey&url=" .. domain
end

function secondurl(domain)
    return "https://archive-it.org/explore?show=Sites&q=" .. domain
end
