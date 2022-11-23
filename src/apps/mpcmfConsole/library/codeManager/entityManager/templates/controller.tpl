<?php
{assign var="data" value=$entityData['struct'][$entityKey]}

namespace {$entityData['moduleNamespace']}\controllers;

use mpcmf\modules\moduleBase\controllers\controllerBase;
use mpcmf\system\pattern\singleton;

/**
 * Class {$data['className']}
 *
{if !empty($entityData['description'])}
 * {$entityData['description']|replace:"\n":"\n * "}
 *
 * @method {$entityData['name']}Mapper getMapper
{/if}
 *
 {include file="generator.tpl"}
 *
 * @package {$entityData['moduleNamespace']}\controllers;
 * @date {"Y-m-d H:i:s"|date:$entityData['date']}
 *
{foreach from=$entityData['authors'] item='author'}
 * @author {$author['name']} <{$author['email']}>
{/foreach}
 */
class {$data['className']}
    extends controllerBase
{

    use singleton;
}