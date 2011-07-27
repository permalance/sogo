/* NSString+MAPIStore.m - this file is part of SOGo
 *
 * Copyright (C) 2010 Inverse inc.
 *
 * Author: Wolfgang Sourdeau <wsourdeau@inverse.ca>
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include <talloc.h>

#import <Foundation/NSData.h>

#import "NSString+MAPIStore.h"

@implementation NSString (MAPIStoreDataTypes)

- (char *) asUnicodeInMemCtx: (void *) memCtx
{
  char *unicode;
  NSData *encoded;

  if ([self length] > 0)
    {
      encoded = [self dataUsingEncoding: NSUTF8StringEncoding];
      unicode = talloc_strndup (memCtx, [encoded bytes], [encoded length]);
    }
  else
    unicode = talloc_memdup (memCtx, "", 1);

  return unicode;
}

@end
